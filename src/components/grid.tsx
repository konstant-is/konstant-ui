import React, { PropsWithChildren } from 'react'
import clsx from 'clsx'

import { getResponsiveClasses, ResponsiveProp } from '@/styles/lib/responsiveProp'
import { GridColSpan, GridColStart, GridColumns, Space } from '@/styles/types'

import { Box } from '../box/box'
import styles from './grid.module.scss'

type Props = PropsWithChildren<{
  className?: string
  columns?: ResponsiveProp<GridColumns>
  gap?: ResponsiveProp<Space>
  collapseMobile?: boolean
}>

export const Grid: React.FC<Props> = ({
  className,
  collapseMobile,
  columns = ['5', '5', '9'],
  gap = ['2', '2', 'lg'],
  children,
}) => {
  const cx = clsx(
    styles.grid,
    getResponsiveClasses('cols', columns, styles),
    getResponsiveClasses('gap', gap, styles),
    collapseMobile && styles.collapse,
  )
  return <div className={clsx(cx, className)}>{children}</div>
}

type CellProps = PropsWithChildren<{
  span?: ResponsiveProp<GridColSpan>
  start?: ResponsiveProp<GridColStart>
  center?: boolean
  className?: string
}>
export const GridCell: React.FC<CellProps> = ({ className, center, start, span, children }) => {
  const classes = useGridCell({ start, span })
  // const spanClasses = getResponsiveClasses('col-span', span, styles)
  // const startClasses = getResponsiveClasses('col-start', start, styles)

  const cx = clsx(styles.col, classes, center && styles.center, className)
  return <Box className={clsx(cx, className)}>{children}</Box>
}

const useGridCell = ({ start, span }: CellProps) => {
  const hasStart = !!start
  const hasSpan = !!span

  // Combine into shorthand class if both present
  const combinedClasses =
    hasStart && hasSpan
      ? getResponsiveCombinedClasses('col-start-span', [start, span], styles)
      : [
          getResponsiveClasses('col-start', start, styles),
          getResponsiveClasses('col-span', span, styles),
        ]

  return combinedClasses
}

function getResponsiveCombinedClasses(
  base: string,
  [start, span]: [ResponsiveProp<any>, ResponsiveProp<any>],
  styles: Record<string, string>,
) {
  // Example: `col-start-span-md-4-6` → maps to `.grid_col-start-4_col-span-6`
  return Object.entries(span ?? {}).map(([breakpoint, spanValue]) => {
    const startValue = typeof start === 'object' ? start[breakpoint] : start
    const className = `col-start-${startValue}-span-${spanValue}`
    return styles[className]
  })
}
