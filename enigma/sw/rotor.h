#pragma once
#include "globals.h"

class rotor{
private:
    int arr[LETTERS];
    int inv[LETTERS];
public:
    rotor();
    rotor(int* arr);
    rotor(int rotor_number);
    void inc();
    int lookup(int x);
    int reverse_lookup(int x);

    int index = 0;
};

const static int rotors[5][LETTERS] = {
    {
        0x04, // A => E
        0x0a, // B => K
        0x0c, // C => M
        0x05, // D => F
        0x0b, // E => L
        0x06, // F => G
        0x03, // G => D
        0x10, // H => Q
        0x15, // I => V
        0x19, // J => Z
        0x0d, // K => N
        0x13, // L => T
        0x0e, // M => O
        0x16, // N => W
        0x18, // O => Y
        0x07, // P => H
        0x17, // Q => X
        0x14, // R => U
        0x12, // S => S
        0x0f, // T => P
        0x00, // U => A
        0x08, // V => I
        0x01, // W => B
        0x11, // X => R
        0x02, // Y => C
        0x09, // Z => J
    },
    {
        0x00, // A => A
        0x09, // B => J
        0x03, // C => D
        0x0a, // D => K
        0x12, // E => S
        0x08, // F => I
        0x11, // G => R
        0x14, // H => U
        0x17, // I => X
        0x01, // J => B
        0x0b, // K => L
        0x07, // L => H
        0x16, // M => W
        0x13, // N => T
        0x0c, // O => M
        0x02, // P => C
        0x10, // Q => Q
        0x06, // R => G
        0x19, // S => Z
        0x0d, // T => N
        0x0f, // U => P
        0x18, // V => Y
        0x05, // W => F
        0x15, // X => V
        0x0e, // Y => O
        0x04, // Z => E
    },
    {
        0x01, // A => B
        0x03, // B => D
        0x05, // C => F
        0x07, // D => H
        0x09, // E => J
        0x0b, // F => L
        0x02, // G => C
        0x0f, // H => P
        0x11, // I => R
        0x13, // J => T
        0x17, // K => X
        0x15, // L => V
        0x19, // M => Z
        0x0d, // N => N
        0x18, // O => Y
        0x04, // P => E
        0x08, // Q => I
        0x16, // R => W
        0x06, // S => G
        0x00, // T => A
        0x0a, // U => K
        0x0c, // V => M
        0x14, // W => U
        0x12, // X => S
        0x10, // Y => Q
        0x0e, // Z => O
    },
    {
        0x04, // A => E
        0x12, // B => S
        0x0e, // C => O
        0x15, // D => V
        0x0f, // E => P
        0x19, // F => Z
        0x09, // G => J
        0x00, // H => A
        0x18, // I => Y
        0x10, // J => Q
        0x14, // K => U
        0x08, // L => I
        0x11, // M => R
        0x07, // N => H
        0x17, // O => X
        0x0b, // P => L
        0x0d, // Q => N
        0x05, // R => F
        0x13, // S => T
        0x06, // T => G
        0x0a, // U => K
        0x03, // V => D
        0x02, // W => C
        0x0c, // X => M
        0x16, // Y => W
        0x01, // Z => B
    },
    {
        0x15, // A => V
        0x19, // B => Z
        0x01, // C => B
        0x11, // D => R
        0x06, // E => G
        0x08, // F => I
        0x13, // G => T
        0x18, // H => Y
        0x14, // I => U
        0x0f, // J => P
        0x12, // K => S
        0x03, // L => D
        0x0d, // M => N
        0x07, // N => H
        0x0b, // O => L
        0x17, // P => X
        0x00, // Q => A
        0x16, // R => W
        0x0c, // S => M
        0x09, // T => J
        0x10, // U => Q
        0x0e, // V => O
        0x05, // W => F
        0x04, // X => E
        0x02, // Y => C
        0x0a, // Z => K
    },
};
