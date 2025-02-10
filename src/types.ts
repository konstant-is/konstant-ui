import { CSSProperties, PropsWithChildren } from 'react'

export type BreakpointValues<T> = {
  sm?: T
  md?: T
  lg?: T
}

export type ResponsiveValue<T> = T | BreakpointValues<T>

export type ResponsiveStyle = {
  padding?:
    | ResponsiveValue<CSSProperties['padding']>
    | ResponsiveValue<{
        top?: CSSProperties['paddingTop']
        bottom?: CSSProperties['paddingBottom']
        left?: CSSProperties['paddingLeft']
        right?: CSSProperties['paddingRight']
      }>
}

export type UIComponentProps<P = unknown> = P &
  PropsWithChildren<{
    className?: string
    style?: React.CSSProperties
    responsive?: ResponsiveStyle
  }>
