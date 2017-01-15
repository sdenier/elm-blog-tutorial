module Tests exposing (..)

import Test exposing (..)
import Test.Routes as RoutesTests


all : Test
all =
    describe "All tests"
        [ RoutesTests.tests
        ]
