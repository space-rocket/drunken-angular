module Bingo where
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)
import StartApp.Simple as StartApp
import Signal exposing (Address)
import Client.Pages.Bingo.BingoUtils as Utils
import Client.Pages.Bingo.BingoModel exposing (..)
import Client.Pages.Bingo.BingoUpdate exposing (..)
import Client.Pages.Bingo.BingoView exposing (..)
--import Debug

-- WIRE IT ALL TOGETHER!
main : Signal Html
main = 
  StartApp.start {
    model = initialModel,
    view =  view,
    update = update
  }
