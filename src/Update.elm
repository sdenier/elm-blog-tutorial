module Update exposing (..)

import Navigation
import Messages exposing (..)
import Models exposing (..)
import Requests
import Routes


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        Navigate url ->
            ( state, Navigation.newUrl url )

        UrlChange location ->
            urlUpdate location state

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

        PostRetrieved (Ok post) ->
            let
                _ =
                    Debug.log "post" post
            in
                ( { state | current = Just post }, Cmd.none )

        PostRetrieved (Err e) ->
            let
                _ =
                    Debug.log "err" e
            in
                ( state, Cmd.none )

        UpdatePostTitle newTitle ->
            let
                newPost =
                    updatePostTitle state.current newTitle

                newState =
                    { state | current = newPost }
            in
                newState ! [ Cmd.none ]

        UpdatePostBody newBody ->
            let
                newPost =
                    updatePostBody state.current newBody

                newState =
                    { state | current = newPost }
            in
                newState ! [ Cmd.none ]


urlUpdate : Navigation.Location -> State -> ( State, Cmd Msg )
urlUpdate location state =
    let
        newRoute =
            (Routes.router location)

        newState =
            { state | route = newRoute }
    in
        case newRoute of
            HomeRoute ->
                ( newState, Requests.retrievePosts )

            NewPostRoute ->
                ( { newState | current = Just newPost }, Cmd.none )

            PostRoute postId ->
                ( newState, Requests.retrievePost postId )

            _ ->
                ( newState, Cmd.none )


updatePostTitle : Maybe Post -> String -> Maybe Post
updatePostTitle current newTitle =
    case current of
        Just post ->
            Just { post | title = newTitle }

        Nothing ->
            Nothing


updatePostBody : Maybe Post -> String -> Maybe Post
updatePostBody current newBody =
    case current of
        Just post ->
            Just { post | body = newBody }

        Nothing ->
            Nothing
