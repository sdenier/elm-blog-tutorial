module Update exposing (..)

import Navigation
import Messages exposing (..)
import Models exposing (..)
import Requests
import Routes exposing (Route(..))


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        ShowHome ->
            ( state, Navigation.newUrl (Routes.reverse HomeRoute) )

        ShowPost postId ->
            ( state, Navigation.newUrl <| (Routes.reverse (PostRoute postId)) )

        UrlChange location ->
            let
                newRoute =
                    (Routes.router location)
            in
                ( { state | route = newRoute }, dispatchRequest newRoute )

        PostsRetrieved (Ok posts) ->
            let
                _ =
                    Debug.log "posts" posts
            in
                ( { state | posts = Just posts }, Cmd.none )

        PostsRetrieved (Err e) ->
            let
                _ =
                    Debug.log "err" e
            in
                ( state, Cmd.none )


dispatchRequest : Route -> Cmd Msg
dispatchRequest route =
    case route of
        HomeRoute ->
            Requests.retrievePosts

        PostRoute postId ->
            Cmd.none

        _ ->
            Cmd.none
