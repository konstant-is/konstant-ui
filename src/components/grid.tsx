import { Slot } from '@radix-ui/react-slot'
import clsx from 'clsx'

import { UIComponentProps } from '@/types'

export type GridProps = UIComponentProps<{
  cols?: number
  gutter?: number
  asChild?: boolean
}>

export const Grid: React.FC<GridProps> = ({ cols, gutter, asChild, children, className }) => {
  const Comp = asChild ? Slot : 'div'

  const getStyles = (): React.CSSProperties => {
    return {
      ...(cols && { '--grid-cols': cols }),
      ...(gutter && { '--grid-gutter': `${gutter}px` }),
    } as React.CSSProperties
  }
  return (
    <Comp className={clsx('grid', className)} style={getStyles()}>
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
