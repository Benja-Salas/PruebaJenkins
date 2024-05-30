import unittest
from hello_world import hello

class TestHelloWorld(unittest.TestCase):
    def test_hello(self):
        self.assertEqual(hello(), "Hello, World!")

if _name_ == "_main_":
    unittest.main()