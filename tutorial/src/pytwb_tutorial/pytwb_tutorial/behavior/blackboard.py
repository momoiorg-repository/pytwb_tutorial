import py_trees
from pytwb.common import behavior

@behavior
class SetBlackboard(py_trees.behaviour.Behaviour):
    desc = 'set blackboard a value'

    def __init__(self, name, key, value):
        super(SetBlackboard, self).__init__(name)
        self.bb = py_trees.blackboard.Blackboard()
        self.key = key
        self.value = value
    
    def initialise(self) -> None:
        self.bb.set(self.key, self.value)
    
    def update(self):
        return py_trees.common.Status.SUCCESS
