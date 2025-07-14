import { createElement, ElementType, forwardRef, HTMLAttributes } from 'react'
import clsx from 'clsx'

import {
  BorderProps,
  FlexProps,
  getBorderClasses,
  getFlexClasses,
  getMarginClasses,
  getPaddingClasses,
  MarginProps,
  PaddingProps,
} from '@/styles/lib/classes'
import { Display, rules } from '@/styles/lib/cssRules'
import { getResponsiveClasses, ResponsiveProp } from '@/styles/lib/responsiveProp'
import tokens from '@/tokens'

import styles from './box.module.scss'

type BoxStyles = PaddingProps &
  MarginProps &
  FlexProps &
  BorderProps & {
    // breakout?: ResponsiveProp<keyof typeof tokens.breakout>
    display?: ResponsiveProp<Display>
    position?: ResponsiveProp<keyof typeof rules.position>
    overflow?: ResponsiveProp<keyof typeof rules.overflow>
    background?: ResponsiveProp<keyof typeof tokens.color>
    color?: ResponsiveProp<keyof typeof tokens.color>
    width?: ResponsiveProp<keyof typeof tokens.width>
    minWidth?: ResponsiveProp<keyof typeof tokens.minWidth>
    height?: ResponsiveProp<keyof typeof tokens.height>
    opacity?: ResponsiveProp<keyof typeof tokens.opacity>
    zIndex?: ResponsiveProp<keyof typeof tokens.zIndex>
    gutter?: boolean
  }

type BoxProps<T extends ElementType> = BoxStyles & {
  component?: T
} & Omit<HTMLAttributes<HTMLElement>, 'component'>

export const Box = forwardRef<HTMLElement, BoxProps<ElementType>>((props, ref) => {
  const {
    component = 'div',
    className,
    display,
    // breakout,
    position,
    overflow,
    background,
    color,
    width,
    minWidth,
    height,
    opacity,
    zIndex,
    gutter,

    padding,
    paddingX,
    paddingY,
    paddingTop,
    paddingBottom,
    paddingLeft,
    paddingRight,

    margin,
    marginX,
    marginY,
    marginTop,
    marginBottom,
    marginLeft,
    marginRight,

    alignItems,
    alignSelf,
    direction,
    grow,
    justify,
    shrink,
    wrap,
    gap,

    border,
    borderWidth,
    borderTopWidth,
    borderRightWidth,
    borderBottomWidth,
    borderLeftWidth,
    borderRadius,
    borderColor,
    ...rest
  } = props

  const cx = clsx(
    gutter && 'gutter',
    getResponsiveClasses('display', display, styles),
    // getResponsiveClasses('breakout', breakout, styles),
    getResponsiveClasses('position', position, styles),
    getResponsiveClasses('overflow', overflow, styles),
    getResponsiveClasses('bg', background, styles),
    getResponsiveClasses('color', color, styles),
    getResponsiveClasses('w', width, styles),
    getResponsiveClasses('min-w', minWidth, styles),
    getResponsiveClasses('h', height, styles),
    getResponsiveClasses('opacity', opacity, styles),
    getResponsiveClasses('z', zIndex, styles),
    getPaddingClasses(
      { padding, paddingX, paddingY, paddingTop, paddingBottom, paddingLeft, paddingRight },
      styles,
    ),
    getMarginClasses(
      {
        margin,
        marginX,
        marginY,
        marginTop,
        marginBottom,
        marginLeft,
        marginRight,
      },
      styles,
    ),
    getFlexClasses(
      {
        alignItems,
        alignSelf,
        direction,
        grow,
        justify,
        shrink,
        wrap,
        gap,
      },
      styles,
    ),
    getBorderClasses(
      {
        border,
        borderWidth,
        borderTopWidth,
        borderRightWidth,
        borderBottomWidth,
        borderLeftWidth,
        borderRadius,
        borderColor,
      },
      styles,
    ),
    className,
  )

  return createElement(component, {
    ref,
    className: clsx(cx),
    ...rest,
  })
})

Box.displayName = 'Box'
