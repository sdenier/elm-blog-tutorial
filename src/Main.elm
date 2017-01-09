module Main exposing (..)

import Navigation
import Html exposing (..)


-- MAIN


main : Program Never State Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }



-- MODEL


type alias State =
    {}


initialState : State
initialState =
    {}


init : Navigation.Location -> ( State, Cmd Msg )
init location =
    ( initialState, Cmd.none )



-- UPDATE


type Msg
    = UrlChange Navigation.Location


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    ( state, Cmd.none )



-- VIEW


view : State -> Html Msg
view model =
    text "Hello World"
