import { Breakpoint } from '../types'

const breakpoints: Breakpoint[] = ['xs', 'sm', 'md', 'lg', 'xl']

/**
 * A tuple-based responsive prop that maps to breakpoints:
 * - [value] → base only
 * - [value1, value2, value3] → base, sm, md, etc.
 */

export type ResponsiveProp<T> =
  | T
  | Readonly<[T]>
  | Readonly<[T, T]>
  | Readonly<[T, T, T]>
  | Readonly<[T, T, T, T]>
  | Readonly<[T, T, T, T, T]>

export function normalizeResponsiveProp<T extends string | number>(
  prop: ResponsiveProp<T>,
): [Breakpoint, T][] {
  if (typeof prop === 'string' || typeof prop === 'number') {
    return [['xs', prop]]
  }

  if (!Array.isArray(prop)) {
    throw new Error(`Invalid responsive prop: ${JSON.stringify(prop)}`)
  }

  const [xs, sm = xs, md = sm, lg = md, xl = lg] = prop

  if (prop.length > 5) {
    throw new Error(`Responsive prop too long: ${JSON.stringify(prop)}`)
  }

  const values: [T, T, T, T, T] = [xs, sm, md, lg, xl]

  let last: T | undefined
  const result: [Breakpoint, T][] = []

  values.forEach((val, i) => {
    if (i === 0 || val !== last) {
      result.push([breakpoints[i], val])
    }
    last = val
  })

  return result
}

export function getResponsiveClasses<T extends string | number>(
  prefix: string,
  prop?: ResponsiveProp<T>,
  styles?: Record<string, string>,
): string[] {
  if (!prop || !styles) return []

  const entries = normalizeResponsiveProp(prop)

  return entries
    .map(([bp, val]) => {
      const key = bp === 'xs' ? `${prefix}-${val}` : `${prefix}-${bp}-${val}`
      return styles[key] ?? ''
    })
    .filter(Boolean)
}

export type ResponsiveRangeProps = {
  below?: ResponsiveProp<Breakpoint>
}

/**
 * Normalize ResponsiveProp into a 5-tuple (xs to xl)
 */
function normalizeResponsiveBreakpoint(
  prop?: ResponsiveProp<Breakpoint>,
): [Breakpoint, Breakpoint, Breakpoint, Breakpoint, Breakpoint] {
  if (!prop) return ['xl', 'xl', 'xl', 'xl', 'xl'] // no collapse

  if (typeof prop === 'string' || typeof prop === 'number') {
    return [prop, prop, prop, prop, prop]
  }

  const [xs, sm = xs, md = sm, lg = md, xl = lg] = prop

  return [xs ?? 'xl', sm ?? 'xl', md ?? 'xl', lg ?? 'xl', xl ?? 'xl']
}

/**
 * For each breakpoint, return true if it's smaller than `below` at that index.
 */
export function getResponsiveRangeProps({
  below,
}: ResponsiveRangeProps): [boolean, boolean, boolean, boolean, boolean] {
  const belowValues = normalizeResponsiveBreakpoint(below)

  return belowValues
    .map((bp) => {
      const index = breakpoints.indexOf(bp)
      return (i: number) => i < index
    })
    .map((check, i) => check(i)) as [boolean, boolean, boolean, boolean, boolean]
}
