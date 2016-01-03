module Client.Pages.Bingo.BingoView where
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)
import StartApp.Simple as StartApp
import Signal exposing (Address)
import Client.Pages.Bingo.BingoUtils as Utils
import Client.Pages.Bingo.BingoModel exposing (..)
import Client.Pages.Bingo.BingoUpdate exposing (..)

title : String -> Int -> Html
title message times =
  message ++ " "
    |> toUpper 
    |> repeat times
    |> trimRight
    |> text

pageHeader : Html
pageHeader =
  h1 [ ] [ title "bingo yo!" 3 ]

entryItem : Address Action -> Entry -> Html
entryItem address entry = 
  li [ 
    classList [ ("highlight", entry.wasSpoken)],
    onClick address (Mark entry.id)
  ] 
    [ i [ class "fa fa-camera-retro fa-lg"] [ ],
      span [ class "phrase"] [ text entry.phrase ],
      span [ class "points"] [ text (toString  entry.points) ],
      button
        [ class "delete", onClick address (Delete entry.id) ]
        [ ]
    ]

totalPoints : List  Entry -> Int
totalPoints entries =
  let
    spokenEntries = List.filter .wasSpoken entries
  in
    List.sum (List.map .points spokenEntries)

totalItem : Int -> Html
totalItem total = 
  li [
      class "total"
      ][
        span [ class "label" ] [ text "total" ],
        span [ class "points" ] [ text (toString total) ]
      ]

entryList : Address Action -> List  Entry -> Html
entryList address entries =
  let
    entryItems = List.map (entryItem address) entries
    items = entryItems ++ [ totalItem (totalPoints entries) ]
  in
    ul [ ] items

entryForm : Address Action -> Model -> Html
entryForm address model =
  div [ ][
    input [
      type' "text",
      placeholder "Phrase",
      value model.phraseInput,
      name "phrase",
      autofocus True,
      Utils.onInput address UpdatePhraseInput
    ][ ],
    input [
      type' "number",
      placeholder "Points",
      value model.pointsInput,
      name "points",
      Utils.onInput address UpdatePointsInput
    ][ ],
    button [
      class "add", onClick address Add
    ][
      text "Add"
    ],
    h2 [ ] [
      text (model.phraseInput ++ " " ++ model.pointsInput )
    ]
  ]



view : Address Action -> Model -> Html
view address model =
  div [ 
    id "container" 
  ][ 
    pageHeader,
    entryForm address model,
    entryList address model.entries,
    button [ 
      class "sort",
      onClick address Sort
    ][ 
      text "Sort" 
    ]
  ]
