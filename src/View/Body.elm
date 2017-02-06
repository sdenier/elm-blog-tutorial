module View.Body exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (..)
import Models exposing (..)
import View.Posts as Posts
import View.Post as Post
import View.NotFound as NotFound


view : State -> Html Msg
view state =
    div [ class "body-wrap" ] [ bodyContent state ]


bodyContent : State -> Html Msg
bodyContent state =
    case state.route of
        HomeRoute ->
            Posts.list state.posts

        PostRoute _ ->
            Post.show state.current

        NewPostRoute ->
            Post.edit state.current

        EditDraftRoute ->
            Post.edit state.current

        NotFound ->
            NotFound.view
