module Tests exposing (..)

import Test exposing (..)
import Test.Routes as RoutesTests
import Test.Requests as RequestsTests


all : Test
all =
    describe "All tests"
        [ RoutesTests.tests
        , RequestsTests.tests
        ]
