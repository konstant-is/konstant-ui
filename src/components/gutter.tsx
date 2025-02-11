import { Slot } from '@radix-ui/react-slot'
import clsx from 'clsx'

import { UIComponentProps } from '@/types'

type Props = {
  asChild?: boolean
  left?: boolean
  right?: boolean
} & UIComponentProps

export const Gutter: React.FC<Props> = ({
  asChild,
  className,
  left = true,
  right = true,
  ...rest
}) => {
  const Comp = asChild ? Slot : 'div'

  return (
    <Comp
      className={clsx('gutter', className, {
        gutter: left && right,
        gutter_left: left && !right,
        gutter_right: right && !left,
      })}
      {...rest}
    />
  )
}
