module Requests exposing (..)

import Http
import Messages exposing (..)
import Models exposing (..)
import Json.Decode as Json


retrievePosts : Cmd Msg
retrievePosts =
    Http.send PostsRetrieved <| Http.get "/api/posts" decodePosts


decodePosts : Json.Decoder (List Post)
decodePosts =
    Json.list decodePost


decodePost : Json.Decoder Post
decodePost =
    Json.map4 Post
        (Json.field "id" Json.int)
        (Json.field "author" Json.string)
        (Json.field "title" Json.string)
        (Json.field "body" Json.string)
