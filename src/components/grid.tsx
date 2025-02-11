import { CSSProperties } from 'react'
import { Slot } from '@radix-ui/react-slot'
import clsx from 'clsx'

import { rb } from '@/lib/responsive'
import { ResponsiveValue, UIComponentProps } from '@/types'

import css from './grid.module.scss'

export type GridProps = UIComponentProps<{
  asChild?: boolean
  cols?: ResponsiveValue<number>
  rows?: ResponsiveValue<number>
  gutter?: ResponsiveValue<CSSProperties['gap']>
  rowGap?: ResponsiveValue<CSSProperties['rowGap']>
  colGap?: ResponsiveValue<CSSProperties['rowGap']>
}>

export const Grid: React.FC<GridProps> = ({
  cols,
  rows,
  gutter,
  rowGap,
  colGap,
  asChild,
  children,
  responsive,
  className,
  style,
}) => {
  const Comp = asChild ? Slot : 'div'

  const injectStyles = rb('grid', responsive, {
    cols,
    rows,
    gutter,
    rowGap,
    colGap,
  })
  return (
    <Comp className={clsx(css.ctr, className)} style={{ ...injectStyles, ...style }}>
      {children}
    </Comp>
  )
}

export type GridColProps = UIComponentProps<{
  asChild?: boolean
}>
export const GridCol: React.FC<GridColProps> = ({ asChild, children }) => {
  const Comp = asChild ? Slot : 'div'

  return <Comp>{children}</Comp>
}
