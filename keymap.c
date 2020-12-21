/* Copyright 2015-2017 Jack Humbert
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include QMK_KEYBOARD_H
#include "muse.h"


enum planck_layers {
  _QWERTY = 0,
  _LOWER,
  _RAISE,
  _ADJUST,
  _NAV,
  _GER,
  _GER_CAP
};

// Some Mocro Stuff 
enum custom_keycodes {
    SMALL_A_UMLAUT_ = SAFE_RANGE,
    CAP_A_UMLAUT_,
    SMALL_O_UMLAUT_,
    CAP_O_UMLAUT_,
    SMALL_U_UMLAUT_,
    CAP_U_UMLAUT_,
    ESSZETT_
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
    case SMALL_A_UMLAUT_:
        if (record->event.pressed) {
            // when keycode QMKBEST is pressed
            SEND_STRING(SS_LALT("u")"a");
        } else {
            // when keycode QMKBEST is released
        }
        break;

    case CAP_A_UMLAUT_:
        if (record->event.pressed) {
            // when keycode QMKURL is pressed
            SEND_STRING(SS_LALT("u")"A");
        } else {
            // when keycode QMKURL is released
        }
        break;
    case SMALL_O_UMLAUT_:
        if (record->event.pressed) {
            // when keycode QMKBEST is pressed
            SEND_STRING(SS_LALT("u")"o");
        } else {
            // when keycode QMKBEST is released
        }
        break;
    case CAP_O_UMLAUT_:
        if (record->event.pressed) {
            // when keycode QMKURL is pressed
            SEND_STRING(SS_LALT("u")"O");
        } else {
            // when keycode QMKURL is released
        }
        break;
    case SMALL_U_UMLAUT_:
        if (record->event.pressed) {
            // when keycode QMKBEST is pressed
            SEND_STRING(SS_LALT("u")"u");
        } else {
            // when keycode QMKBEST is released
        }
        break;
    case CAP_U_UMLAUT_:
        if (record->event.pressed) {
            // when keycode QMKURL is pressed
            SEND_STRING(SS_LALT("u")"U");
        } else {
            // when keycode QMKURL is released
        }
        break;
    case ESSZETT_:
        if (record->event.pressed) {
            // when keycode QMKBEST is pressed
            SEND_STRING(SS_LALT("s"));
        } else {
            // when keycode QMKBEST is released
        }
        break;
    }
    return true;
};
//End some Macro Stuff




#define LOWER MO(_LOWER)
#define RAISE MO(_RAISE)
#define NAV MO(_NAV)
#define GER MO(_GER)
#define GER_CAP MO(_GER_CAP)


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* Qwerty
 * ,-----------------------------------------------------------------------------------.
 * | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  | Bksp |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Esc  |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  |  "   |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  |r ctrl|
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Brite| Ctrl | Alt  | GUI  |Lower |    Space    |Raise | GER  | Down |  Up  |Enter |
 * `-----------------------------------------------------------------------------------'
 */
[_QWERTY] = LAYOUT_planck_grid(
    KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_BSPC,
    LCTL_T(KC_ESC),  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
    KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT,
    KC_LCTL,  NAV, KC_LALT, KC_LGUI, LOWER,   KC_SPC,  KC_SPC,  RAISE,  GER, KC_LEFT, KC_RIGHT,   KC_ENT
),

/* Lower
 * ,-----------------------------------------------------------------------------------.
 * |      |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  | Del  |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |   4  |   5  |   6  |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |   1  |   2  |   3  |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |  ,   |  0   |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_LOWER] = LAYOUT_planck_grid(
    _______,    KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,  KC_DEL,
    _______, _______, _______, _______, _______, _______, _______, KC_KP_4, KC_KP_5, KC_KP_6, _______, _______, 
    _______, _______, _______, _______, _______, _______, _______, KC_KP_1, KC_KP_2, KC_KP_3, _______, _______, 
    _______, _______, _______, _______, _______, _______, _______, _______, KC_KP_0, _______, _______, _______ 
),

/* Raise
 * ,-----------------------------------------------------------------------------------.
 * |      |   !  |   @  |   #  |   $  |   %  |   ^  |   &  |   *  |   (  |   )  | Bksp |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |  +   |  -   |  {   |   (  |  [   |  ]   |   )  |   }  |   _  |   =  |  \   |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      | ~    |  `   |      |      |      |      |      |      |      |  |   |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_RAISE] = LAYOUT_planck_grid(
     _______, KC_EXCLAIM, KC_AT, KC_HASH, KC_DOLLAR, KC_PERCENT, KC_CIRCUMFLEX, KC_AMPERSAND, KC_ASTERISK, KC_LEFT_PAREN, KC_RIGHT_PAREN, KC_BSPC, 
     _______,  KC_PLUS,  KC_MINUS,  KC_LCBR, KC_LEFT_PAREN, KC_LBRACKET,  KC_RBRACKET, KC_RIGHT_PAREN, KC_RCBR, KC_UNDERSCORE, KC_EQUAL, KC_BSLASH, 
     _______,  KC_TILDE,  KC_GRAVE, _______,  _______,  _______,  _______,  _______,  _______,  _______,  KC_PIPE,  _______, 
     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______ 
),

/* Adjust (Lower + Raise)
 *                      v------------------------RGB CONTROL--------------------v
 * ,-----------------------------------------------------------------------------------.
 * |      |Bri_up|Bri_do|      |      |prev  |play  |next  |vol_do|vol_up|mute  |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |c_lock|      |mu_mo |mu_tog|aud_t |      |      |      |      |      |      |reset |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_ADJUST] = LAYOUT_planck_grid(
    _______, KC_BRIGHTNESS_UP, KC_BRIGHTNESS_DOWN, _______, _______, KC_MEDIA_PREV_TRACK, KC_MEDIA_PLAY_PAUSE, KC_MEDIA_NEXT_TRACK, KC_AUDIO_VOL_DOWN, KC_AUDIO_VOL_UP, KC_AUDIO_MUTE, _______,
     _______, MU_ON,  MU_OFF,  MU_MOD,  _______,  _______,  RGB_TOG,  _______,  _______,  _______,  _______,  RESET,
     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,
     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______ 
),

/* Adjust (Lower + Raise)
 *                      v------------------------VIM Like Navigation-------------------v
 * ,-----------------------------------------------------------------------------------.
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |left  |down  |up    |right |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_NAV] = LAYOUT_planck_grid(

     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,
     _______,  _______,  _______,  _______,  _______,  _______,  KC_LEFT, KC_DOWN,  KC_UP,  KC_RIGHT,  _______,  _______, 
     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______, 
     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______ 
),
/* _GER 
 *                      v------------------------Small Umauts-------------------v
 * ,-----------------------------------------------------------------------------------.
 * |      |      |      |      |      |      |      |  ü   |      |   ö  |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |   ä  |  ß   |      |      |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |Shift |      |      |      |      |      |      |      |      |      |      |Shift |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_GER] = LAYOUT_planck_grid(

     _______,  _______,  _______,  _______,  _______,  _______,  _______,  SMALL_U_UMLAUT_,  _______,  SMALL_O_UMLAUT_,  _______,  _______,
     _______,  SMALL_A_UMLAUT_,  ESSZETT_,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______, 
     GER_CAP,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  GER_CAP, 
     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______ 
),

/* Capital Umlauts 
 *                      v------------------------Capital Umlauts-------------------v
 * ,-----------------------------------------------------------------------------------.
 * |      |      |      |      |      |      |      |  Ö   |      |  Ö   |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |  Ä   |      |      |      |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_GER_CAP] = LAYOUT_planck_grid(

     _______,  _______,  _______,  _______,  _______,  _______,  _______,  CAP_U_UMLAUT_,  _______,  CAP_O_UMLAUT_,  _______,  _______,
     _______,  CAP_A_UMLAUT_,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______, 
     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______, 
     _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______ 
)
};

#ifdef AUDIO_ENABLE
  float plover_song[][2]     = SONG(PLOVER_SOUND);
  float plover_gb_song[][2]  = SONG(PLOVER_GOODBYE_SOUND);
#endif

layer_state_t layer_state_set_user(layer_state_t state) {
  return update_tri_layer_state(state, _LOWER, _RAISE, _ADJUST);
}


bool muse_mode = false;
uint8_t last_muse_note = 0;
uint16_t muse_counter = 0;
uint8_t muse_offset = 70;
uint16_t muse_tempo = 50;

void encoder_update(bool clockwise) {
  if (muse_mode) {
    if (IS_LAYER_ON(_RAISE)) {
      if (clockwise) {
        muse_offset++;
      } else {
        muse_offset--;
      }
    } else {
      if (clockwise) {
        muse_tempo+=1;
      } else {
        muse_tempo-=1;
      }
    }
  } else {
    if (clockwise) {
      #ifdef MOUSEKEY_ENABLE
        tap_code(KC_MS_WH_DOWN);
      #else
        tap_code(KC_PGDN);
      #endif
    } else {
      #ifdef MOUSEKEY_ENABLE
        tap_code(KC_MS_WH_UP);
      #else
        tap_code(KC_PGUP);
      #endif
    }
  }
}

void dip_switch_update_user(uint8_t index, bool active) {
    switch (index) {
        case 0: {
#ifdef AUDIO_ENABLE
            static bool play_sound = false;
#endif
            if (active) {
#ifdef AUDIO_ENABLE
                if (play_sound) { PLAY_SONG(plover_song); }
#endif
                layer_on(_ADJUST);
            } else {
#ifdef AUDIO_ENABLE
                if (play_sound) { PLAY_SONG(plover_gb_song); }
#endif
                layer_off(_ADJUST);
            }
#ifdef AUDIO_ENABLE
            play_sound = true;
#endif
            break;
        }
        case 1:
            if (active) {
                muse_mode = true;
            } else {
                muse_mode = false;
            }
    }
}

void matrix_scan_user(void) {
#ifdef AUDIO_ENABLE
    if (muse_mode) {
        if (muse_counter == 0) {
            uint8_t muse_note = muse_offset + SCALE[muse_clock_pulse()];
            if (muse_note != last_muse_note) {
                stop_note(compute_freq_for_midi_note(last_muse_note));
                play_note(compute_freq_for_midi_note(muse_note), 0xF);
                last_muse_note = muse_note;
            }
        }
        muse_counter = (muse_counter + 1) % muse_tempo;
    } else {
        if (muse_counter) {
            stop_all_notes();
            muse_counter = 0;
        }
    }
#endif
}

bool music_mask_user(uint16_t keycode) {
  switch (keycode) {
    case RAISE:
    case LOWER:
      return false;
    default:
      return true;
  }
}
