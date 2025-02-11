import { CSSProperties } from 'react'
import { Slot } from '@radix-ui/react-slot'

import { rb } from '@/lib/responsive'
import { cn } from '@/lib/utils'
import type { ResponsiveValue, UIComponentProps } from '@/types'

export type StackProps = {
  asChild?: boolean
  direction?: ResponsiveValue<CSSProperties['flexDirection']>
  alignItems?: ResponsiveValue<CSSProperties['alignItems']>
  justify?: ResponsiveValue<CSSProperties['justifyContent']>
  flex?: ResponsiveValue<CSSProperties['flex']>
  gap?: ResponsiveValue<CSSProperties['gap']>
} & UIComponentProps

export const Stack: React.FC<StackProps> = ({
  asChild,
  className,
  style,
  responsive,
  direction,
  alignItems,
  justify,
  flex,
  gap,
  ...props
}) => {
  const Comp = asChild ? Slot : 'div'

  const injectStyles = rb('stack', responsive, {
    direction,
    alignItems,
    justify,
    flex,
    gap,
  })

  return (
    <Comp className={cn('stack', className)} style={{ ...injectStyles, ...style }} {...props} />
  )
}
