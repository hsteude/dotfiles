from pdb import DefaultConfig


class Config(DefaultConfig):
    sticky_by_default = True
    editor = '${EDITOR:-vi}'
