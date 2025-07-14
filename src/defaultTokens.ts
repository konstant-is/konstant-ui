import {px} from './lib/utils'

const unit = 8

export const breakpoints = {
  xs: px(0),
  sm: px(600),
  md: px(800),
  lg: px(992),
  xl: px(1440),
}

export const space = {
  none: '0px',
  xs: '4px',
  sm: '8px',
  md: '16px',
  lg: '32px',
  '0': px(unit * 0),
  '1': px(unit * 1),
  '2': px(unit * 2),
  '3': px(unit * 3),
  '4': px(unit * 4),
  '5': px(unit * 5),
  '6': px(unit * 6),
  '7': px(unit * 7),
  '8': px(unit * 8),
  '9': px(unit * 9),
  '10': px(unit * 10),
  '12': px(unit * 12),
  '13': px(unit * 13),
  '16': px(unit * 16),
  '20': px(unit * 20),
  '24': px(unit * 24),
  '28': px(unit * 28),
} as const

export const color = {
  black: '#000000',
  white: '#FFFFFF',
  transparent: 'transparent',

  background: '#FFFFFF',
  foreground: '#000000',
}

export const defaultTokens = {
    color,
    breakpoints,
    space,
    width: {
    full: '100%',
    half: '50%',
    auto: 'auto',
    fit: 'fit-content',
  },
  minWidth: {
    0: '0%',
    full: '100%',
  },
  height: {
    full: '100%',
    screen: '100vh',
    auto: 'auto',
  },
  opacity: {
    '0': 0,
    '50': 0.5,
    '100': 1,
  },
  zIndex: {
    '0': 0,
    '10': 10,
    '20': 20,
    '30': 30,
    '40': 40,
    '50': 50,
    '60': 60,
    '70': 70,
    '80': 80,
    '90': 90,
  },
  gridCols: {
    '1': 'repeat(1, minmax(0, 1fr))',
    '2': 'repeat(2, minmax(0, 1fr))',
    '3': 'repeat(3, minmax(0, 1fr))',
    '4': 'repeat(4, minmax(0, 1fr))',
    '5': 'repeat(5, minmax(0, 1fr))',
    '6': 'repeat(6, minmax(0, 1fr))',
    '7': 'repeat(7, minmax(0, 1fr))',
    '8': 'repeat(8, minmax(0, 1fr))',
    '9': 'repeat(9, minmax(0, 1fr))',
    '10': 'repeat(10, minmax(0, 1fr))',
    '11': 'repeat(11, minmax(0, 1fr))',
    '12': 'repeat(12, minmax(0, 1fr))',
  },
  colSpan: {
    full: '1 / -1',
    // Direct 12ths (recommended for layout precision)
    '1': 'span 1 / span 1',
    '2': 'span 2 / span 2',
    '3': 'span 3 / span 3',
    '4': 'span 4 / span 4',
    '5': 'span 5 / span 5',
    '6': 'span 6 / span 6',
    '7': 'span 7 / span 7',
    '8': 'span 8 / span 8',
    '9': 'span 9 / span 9',
    '10': 'span 10 / span 10',
    '11': 'span 11 / span 11',
    '12': 'span 12 / span 12',
  },
  colStart: {
    auto: 'auto',
    '1': '1',
    '2': '2',
    '3': '3',
    '4': '4',
    '5': '5',
    '6': '6',
    '7': '7',
    '8': '8',
    '9': '9',
    '10': '10',
    '11': '11',
    '12': '12',
  },
}