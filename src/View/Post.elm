module View.Post exposing (show, edit)

import Html exposing (..)
import Html.Attributes exposing (class, placeholder, value)
import Html.Events exposing (onInput)
import Messages exposing (..)
import Models exposing (..)


show : Maybe Post -> Html msg
show current =
    case current of
        Just post ->
            div []
                [ h2 [] [ text post.title ]
                , text post.body
                ]

        Nothing ->
            div [] [ text "No post to show" ]


edit : Maybe Post -> Html Msg
edit current =
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
