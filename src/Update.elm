module Update exposing (..)

import Navigation
import Messages exposing (..)
import Models exposing (..)
import Routes exposing (router)


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        ShowHome ->
            ( state, Navigation.newUrl "/" )

        ShowPost postId ->
            ( state, Navigation.newUrl <| "/posts/" ++ (toString postId) )

        UrlChange location ->
            ( { state | route = (router location) }, Cmd.none )
