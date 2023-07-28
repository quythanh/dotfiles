#!/usr/bin/env python

from json import dumps
from subprocess import check_output, CalledProcessError

def get_update():
    check = lambda cmd: check_output(cmd, shell=True).decode('utf-8').strip('\n').split('\n')
    official, aur = [], []
    try:
        official = check('checkupdates')
    except CalledProcessError:
        pass

    try:
        aur = check('yay -Qua')
    except CalledProcessError:
        pass

    return official, aur


def draw_table(list_pkgs, table_name):
    '''
    ╭─────┬───────────────────────────┬──────────────────────┬──────────────────────╮
    │ No. │ │
    ├─────┼───────────────────────────┤
    │  1. │ │
    ╰─────┴───────────────────────────╯
    '''

    if (cnt := len(list_pkgs)) == 0:
        return ""

    replacer = lambda oldStr, index, newStr: f'{oldStr[:index]}{newStr}{oldStr[index+1:]}'
    title = f"│ {table_name.upper()}: {cnt} package{'' if cnt == 1 else 's'} │\n"

    table = "╭" + "─"*(len(title) - 3) + "╮\n"
    table += title
    table += replacer("├─────┬─────────────────────────────────────┬───────────────────────────┬───────────────────────────╮\n", len(title)-2, "┴")
    table += "│ No. │               Package               │        Old Version        │        New Version        │\n"
    table += "├─────┼─────────────────────────────────────┼───────────────────────────┼───────────────────────────┤\n"

    for i, pkg in enumerate(list_pkgs):
        pkg = pkg.split(' ')
        table += "│ {:>2d}. │ {:<35s} │ {:^25s} │ {:^25s} │\n".format(i+1, pkg[0], pkg[1], pkg[3])
    table += "╰─────┴─────────────────────────────────────┴───────────────────────────┴───────────────────────────╯"
    return table


def join_table(table_1, table_2):
    if (table_1 == ""): return table_2
    if (table_2 == ""): return table_1
    
    i = 0
    table = ""
    while i < len(table_1) and i < len(table_2):
        table += "{:<101s} {:<101s}\n".format(table_1[i], table_2[i])
        i = i + 1

    while i < len(table_1):
        table += table_1[i] + '\n'
        i = i + 1
    while i < len(table_2):
        table += "{:<101s} {:<101s}\n".format('', table_2[i])
        i = i + 1

    return table


if __name__ == "__main__":
    official, aur = get_update()

    data = {}
    data["text"] = f" {len(official) + len(aur)}"
    data['tooltip'] = '' if (len(official) + len(aur) != 0) else 'Already up-to-date'
    data['tooltip'] += draw_table(official, 'official')

    data['tooltip'] += '\n' if len(official) > 0 and len(aur) > 0 else ''
    data['tooltip'] += draw_table(aur, 'aur')
    # data['tooltip'] += join_table(draw_table(official, 'official'), draw_table(aur, 'aur'))

    print(dumps(data))

