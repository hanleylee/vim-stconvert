# vim:set et fileencoding=utf8 nowrap sts=0 sw=4 ts=4:

import string
import vim
import re
import json
import os

# use like this:
#
# py3 << EOF
# import vim
# import asciiart
# vimsnippets.print_hello()
# EOF

# ref:
# - <https://zh.m.wikisource.org/zh-hans/通用规范汉字表>
# - <http://www.moe.gov.cn/jyb_sjzl/ziliao/A19/201306/t20130601_186002.html>
#
# 部分简体字在古代也是存在的, 比如 '云', '卜', 虽然有 '雲' 和 '蔔', 但是用于不同语境, 解决起来较为复杂, 本插件不考虑这种情况

cur_py_file = os.path.abspath(__file__)
chars_file = os.path.abspath(os.path.join(cur_py_file, '../../resource/chars_data.json'))
# print(chars_file)
chars_stream = open(chars_file)
char_info_list: list[dict] = json.load(chars_stream)

def char_convert(type):
    """
    type: s2t/t2s/yts
    """
    chars_pair_dict: dict = {}
    for char_info in char_info_list:
        fanti_chars: list[str] = char_info.get("fanti", [])
        yiti_chars: list[str] = char_info.get("yiti", [])
        jianti_char: str = char_info.get("jianti")
        if type == 's2t': # simplified => traditional
            if fanti_chars:
                # 如果简体转繁体, 当同一个简体字对应多个繁体字时, 默认使用数据库种的第一个繁体字
                chars_pair_dict[jianti_char] = fanti_chars[0]
        elif type == 't2s': # traditional => simplified
            for fanti_char in fanti_chars:
                chars_pair_dict[fanti_char] = jianti_char
        elif type == 'y2s': # yiti => simplified
            for yiti_char in yiti_chars:
                chars_pair_dict[yiti_char] = jianti_char
        else:
            print('type is unsupported!', type)
            exit(1)

    # 获取当前选中的范围
    firstline = int(vim.eval('a:firstline'))
    lastline = int(vim.eval('a:lastline'))

    # 遍历选中的每一行
    for l in range(firstline, lastline + 1):
        line = vim.current.buffer[l - 1]
        newline = []
        # for index, char in enumerate(line):
        for char in line:
            if char in chars_pair_dict:
                newline.append(chars_pair_dict[char])
            else:
                newline.append(char)
        vim.current.buffer[l - 1] = ''.join(newline)
