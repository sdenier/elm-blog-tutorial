module View.Post.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, placeholder, value)
import Html.Events exposing (onInput)
import Messages exposing (..)
import Models exposing (..)


view : Maybe Post -> Html Msg
view current =
    div [ class "post-editor" ]
        [ input
            [ onInput UpdatePostTitle
            , class "title-input-field"
            , placeholder "Enter title"
            , value (postTitle current)
            ]
            []
        , textarea
            [ onInput UpdatePostBody
            , class "body-input-field"
            , placeholder "Enter body"
            ]
            [ text (postBody current) ]
        ]


postTitle : Maybe Post -> String
postTitle current =
    case current of
        Just post ->
            post.title

        Nothing ->
            ""


postBody : Maybe Post -> String
postBody current =
    case current of
        Just post ->
            post.body

        Nothing ->
            ""
