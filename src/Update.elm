module Update exposing (..)

import Navigation
import Messages exposing (..)
import Models exposing (..)
import Routes exposing (Route(..))


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        ShowHome ->
            ( state, Navigation.newUrl (Routes.reverse HomeRoute) )

        ShowPost postId ->
            ( state, Navigation.newUrl <| (Routes.reverse (PostRoute postId)) )

        UrlChange location ->
            ( { state | route = (Routes.router location) }, Cmd.none )

        PostsRetrieved (Ok posts) ->
            let
                _ =
                    Debug.log "posts" posts
            in
                ( state, Cmd.none )

        PostsRetrieved (Err e) ->
            let
                _ =
                    Debug.log "err" e
            in
                ( state, Cmd.none )
