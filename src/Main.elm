module Main exposing (..)

import Element exposing (Element, el, text, column, row, image, alignRight, fill, width, rgb255, spacing, centerY, centerX, padding, px)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input exposing (button)
import Browser
import Html exposing (Html, img)
import Html.Events exposing (onClick)
import Html.Attributes exposing (src)
import Element exposing (layout)


type alias Model =
    { typeOfSound : Sound }

type Msg
    = ClickedSoundButton Sound

-- type Sound
--     = Birds
--         { expanded : Bool }
--     | Boat
--         { expanded : Bool }
--     | City
--         { expanded : Bool }
--     | Cafe
--         { expanded : Bool }
--     | Fire
--         { expanded : Bool }
--     | Wind
--         { expanded : Bool }
--     | Rain
--         { expanded : Bool }
--     | Thunder
--         { expanded : Bool }
--     | SummerNight
--         { expanded : Bool }
--     | Waves
--         { expanded : Bool }
--     | WhiteNoise
--         { expanded : Bool }
--     | PinkNoise
--         { expanded : Bool }

type Sound
    = Birds
    | Boat
    | City
    | Cafe
    | Fire
    | Wind
    | Rain
    | Thunder
    | SummerNight
    | Waves
    | WhiteNoise
    | PinkNoise


view : a -> Html Msg
view _ = 
    layout [ Background.color (rgb255 0 0 0) ] <|
        column [ width fill, centerY, spacing 30 ]
        [
            row [ spacing 10, centerX ] [ soundButton Birds, soundButton Boat, soundButton City, soundButton Cafe ]
            , row [ spacing 10, centerX ] [ soundButton Fire, soundButton Wind, soundButton Rain, soundButton Thunder ]
            , row [ spacing 10, centerX ] [ soundButton SummerNight, soundButton Waves, soundButton WhiteNoise, soundButton PinkNoise ]
        ]


update msg model =
    case msg of
        ClickedSoundButton sound ->
            ( { model | typeOfSound = sound }, Cmd.none )
            

soundButton sound =
    image
        [ Background.color (rgb255 0 0 255)
        , Border.rounded 5
        , Border.width 1
        , Border.color (rgb255 0 0 0)
        , width (px 100)
        , padding 10
        , spacing 10
        , centerY
        ]
        { src = "../public/img/" ++ soundToString sound ++ ".svg"
        , description = soundToString sound
        }


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
            "SummerNight"

        Waves ->
            "Waves"

        WhiteNoise ->
            "WhiteNoise"

        PinkNoise ->
            "PinkNoise"


init : () -> ( Model, Cmd Msg )
init _ =
    ( { typeOfSound = Birds }
    , Cmd.none
    )


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }