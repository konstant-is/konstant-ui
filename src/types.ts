import tokens from './tokens'

export type Color = keyof typeof tokens.color
export type TokenColor = keyof typeof tokens.color

export type Breakpoint = keyof typeof tokens.breakpoints // 'sm' | 'md' | 'lg' | 'xl'
export type Space = keyof typeof tokens.space

export type GridColumns = keyof typeof tokens.gridCols // 1 | 4 | 6 | 8 | 12
export type GridColSpan = keyof typeof tokens.colSpan
export type GridColStart = keyof typeof tokens.colStart
