module Main exposing (..)

import Element exposing (Element, el, text, row, alignRight, fill, width, rgb255, spacing, centerY, padding)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Browser
import Html.Events exposing (onClick)


type alias Model =
    { typeOfSound : Sound }

type Msg
    = ClickedSoundButton Sound

type Sound
    = Birds
        { expanded : Bool }
    | Boat
        { expanded : Bool }
    | City
        { expanded : Bool }
    | Cafe
        { expanded : Bool }
    | Fire
        { expanded : Bool }
    | Wind
        { expanded : Bool }
    | Rain
        { expanded : Bool }
    | Thunder
        { expanded : Bool }
    | SummerNight
        { expanded : Bool }
    | Waves
        { expanded : Bool }
    | WhiteNoise
        { expanded : Bool }
    | PinkNoise
        { expanded : Bool }


view = 
    el
        [ Background.color (rgb255 0 0 0) ]
        [
            row [ width fill, centerY, spacing 30 ]
                [ soundButton Birds
                , soundButton Boat
                , soundButton City
                , soundButton Cafe
                ]
            , row [ width fill, centerY, spacing 30 ]
                [ soundButton Fire
                , soundButton Wind
                , soundButton Rain
                , soundButton Thunder
                ]
            , row [ width fill, centerY, spacing 30 ]
                [ soundButton SummerNight
                , soundButton Waves
                , soundButton WhiteNoise
                , soundButton PinkNoise
                ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        ClickedSoundButton sound ->
            { sound | expanded = not sound.expanded }





soundButton : Sound -> Element msg
soundButton sound =
    el
        [ Background.color (rgb255 255 255 255)
        , Border.rounded 5
        , Border.width 1
        , Border.color (rgb255 0 0 0)
        , width 100
        , padding 10
        , spacing 10
        , centerY
        , onClick (ClickedSoundButton sound)
        ]
        [ text (soundToString sound) ]


soundToString : Sound -> String
soundToString sound =
    case sound of
        Birds ->
            "Birds"

        Boat ->
            "Boat"

        City ->
            "City"

        Cafe ->
            "Cafe"

        Fire ->
            "Fire"

        Wind ->
            "Wind"

        Rain ->
            "Rain"

        Thunder ->
            "Thunder"

        SummerNight ->
            "Summer Night"

        Waves ->
            "Waves"

        WhiteNoise ->
            "White Noise"

        PinkNoise ->
            "Pink Noise"


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }