import { ElementType, PropsWithChildren } from 'react'
import clsx from 'clsx'

import { Box } from './box/box'
import styles from './gutter.module.scss'

type Props<T extends ElementType> = PropsWithChildren<{
  className?: string
  el?: T
}>
/**
 * Gutter component applies a max-width container with horizontal padding.
 * Uses the Box component as a base and applies responsive gutter styles.
 */
export const Gutter = ({ className, el, children }: Props<ElementType>) => {
  return (
    <Box component={el} className={clsx(styles.gutter, className)}>
      {children}
    </Box>
  )
}
