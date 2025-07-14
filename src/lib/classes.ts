import clsx from 'clsx'

import tokens from '@/tokens'

import { Space } from '../types'
import { Flex } from './cssRules'
import { getResponsiveClasses, ResponsiveProp } from './responsiveProp'

type Style = Record<string, string>

export type PaddingProps = {
  padding?: ResponsiveProp<Space>
  paddingX?: ResponsiveProp<Space>
  paddingY?: ResponsiveProp<Space>
  paddingTop?: ResponsiveProp<Space>
  paddingBottom?: ResponsiveProp<Space>
  paddingLeft?: ResponsiveProp<Space>
  paddingRight?: ResponsiveProp<Space>
}
export function getPaddingClasses(props: PaddingProps, styles: Style) {
  return clsx(
    getResponsiveClasses('p', props.padding, styles),
    getResponsiveClasses('pt', props.paddingTop, styles),
    getResponsiveClasses('pb', props.paddingBottom, styles),
    getResponsiveClasses('pl', props.paddingLeft, styles),
    getResponsiveClasses('pr', props.paddingRight, styles),
    getResponsiveClasses('px', props.paddingX, styles),
    getResponsiveClasses('py', props.paddingY, styles),
  )
}

export type MarginProps = {
  margin?: ResponsiveProp<Space>
  marginX?: ResponsiveProp<Space>
  marginY?: ResponsiveProp<Space>
  marginTop?: ResponsiveProp<Space>
  marginBottom?: ResponsiveProp<Space>
  marginLeft?: ResponsiveProp<Space>
  marginRight?: ResponsiveProp<Space>
}

export function getMarginClasses(props: MarginProps, styles: Style) {
  return clsx(
    getResponsiveClasses('m', props.margin, styles),
    getResponsiveClasses('mt', props.marginTop, styles),
    getResponsiveClasses('mb', props.marginBottom, styles),
    getResponsiveClasses('ml', props.marginLeft, styles),
    getResponsiveClasses('mr', props.marginRight, styles),
    getResponsiveClasses('mx', props.marginX, styles),
    getResponsiveClasses('my', props.marginY, styles),
  )
}

export type FlexProps = {
  alignItems?: ResponsiveProp<Flex['alignItems']>
  alignSelf?: ResponsiveProp<Flex['alignSelf']>
  direction?: ResponsiveProp<Flex['direction']>
  grow?: ResponsiveProp<Flex['grow']>
  justify?: ResponsiveProp<Flex['justifyContent']>
  shrink?: ResponsiveProp<Flex['shrink']>
  wrap?: ResponsiveProp<Flex['wrap']>
  gap?: ResponsiveProp<Space>
}

export const getFlexClasses = (props: FlexProps, styles: Style) => {
  return clsx(
    getResponsiveClasses('items', props.alignItems, styles),
    getResponsiveClasses('alignSelf', props.alignSelf, styles),
    getResponsiveClasses('direction', props.direction, styles),
    getResponsiveClasses('grow', props.grow, styles),
    getResponsiveClasses('justify', props.justify, styles),
    getResponsiveClasses('shrink', props.shrink, styles),
    getResponsiveClasses('wrap', props.wrap, styles),
    getResponsiveClasses('gap', props.gap, styles),
  )
}

export type BorderProps = {
  border?: ResponsiveProp<keyof typeof tokens.border.style>
  borderWidth?: ResponsiveProp<keyof typeof tokens.border.width>
  borderTopWidth?: ResponsiveProp<keyof typeof tokens.border.width>
  borderRightWidth?: ResponsiveProp<keyof typeof tokens.border.width>
  borderBottomWidth?: ResponsiveProp<keyof typeof tokens.border.width>
  borderLeftWidth?: ResponsiveProp<keyof typeof tokens.border.width>
  borderRadius?: ResponsiveProp<keyof typeof tokens.border.radius>
  borderColor?: ResponsiveProp<keyof typeof tokens.border.radius>
}

export function getBorderClasses(props: BorderProps, styles: Style) {
  return clsx(
    getResponsiveClasses('border', props.border, styles),
    getResponsiveClasses('border-width', props.borderWidth, styles),
    getResponsiveClasses('border-top-width', props.borderTopWidth, styles),
    getResponsiveClasses('border-right-width', props.borderRightWidth, styles),
    getResponsiveClasses('border-bottom-width', props.borderBottomWidth, styles),
    getResponsiveClasses('border-left-width', props.borderLeftWidth, styles),
    getResponsiveClasses('rounded', props.borderRadius, styles),
    getResponsiveClasses('border-color', props.borderColor, styles),
  )
}
