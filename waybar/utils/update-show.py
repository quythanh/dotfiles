#!/usr/bin/env python3

from json import dumps
from subprocess import check_output, CalledProcessError

def _get_update():
    def __check(*cmds) -> tuple[list]:
        cmd, *rest_cmds = cmds
        
        if len(rest_cmds) > 0:
            return *__check(cmd), *__check(*rest_cmds)

        try:
            list_packages = check_output(cmd, shell=True).decode('utf-8').strip('\n').split('\n')
        except CalledProcessError:
            list_packages = []
        return (list_packages, )

    return __check('checkupdates', 'yay -Qua')


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

    def replacer(oldStr: str, index, newStr: str):
        return f'{oldStr[:index]}{newStr}{oldStr[index+1:]}'

    title = f"│ {table_name.upper()}: {cnt} package{'' if cnt == 1 else 's'} │\n"

    table = "╭" + "─"*(len(title) - 3) + "╮\n"
    table += title
    table += replacer(
             "├─────┬─────────────────────────────────────┬─────────────────────────────────┬─────────────────────────────────╮\n", len(title)-2, "┴")
    table += "│ No. │               Package               │           Old Version           │           New Version           │\n"
    table += "├─────┼─────────────────────────────────────┼─────────────────────────────────┼─────────────────────────────────┤\n"

    for i, pkg in enumerate(list_pkgs):
        pkg = pkg.split(' ')
        table += f"│ {i+1:>2d}. │ {pkg[0]:<35s} │ {pkg[1]:^31s} │ {pkg[3]:^31s} │\n"
    table += "╰─────┴─────────────────────────────────────┴─────────────────────────────────┴─────────────────────────────────╯"
    return table


# Incomplete...
class Table:
    def __init__(self, title: str, list_packages: list):
        self.title = title
        self.packages = list_packages

    def __row_join(*rows: list[str]) -> str:
        return "\n".join(rows)

    def _draw_title(self) -> tuple[bool, str]:
        '''
        '''
        count = len(self.packages)
        if count == 0:
            return False, ""

        title = f"│ {self.title.upper()}: {count} package{'' if count == 1 else 's'} │"
        title_top_border = "╭" + "─"*(len(title) - 3) + "╮"

        return True, self.__row_join(title_top_border, title)

    def __str__(self) -> str:
        return self.title


if __name__ == "__main__":
    official, aur = _get_update()

    data = {}
    data["text"] = f" {len(official) + len(aur)}"
    data['tooltip'] = '' if (len(official) + len(aur) != 0) else 'Already up-to-date'
    data['tooltip'] += draw_table(official, 'official')

    data['tooltip'] += '\n' if len(official) > 0 and len(aur) > 0 else ''
    data['tooltip'] += draw_table(aur, 'aur')

    print(dumps(data))

