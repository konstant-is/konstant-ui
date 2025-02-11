import { CSSProperties } from 'react'

import { BreakpointValues, ResponsiveStyle, ResponsiveValue } from '@/types.js'

// // 🔹 Helper function to create CSS variable
// const createVariable = <T>(bp: string, variable: string, value?: T) =>
//   value !== undefined ? { [`--${bp}-${variable}`]: value } : {}

// // 🔹 Main function to resolve breakpoints
// export function resolveBreakpoints<T>(
//   value: ResponsiveValue<T>,
//   cssVariable: string,
// ): CSSProperties {
//   if (value && typeof value === 'object' && !Array.isArray(value)) {
//     const responsiveValue = value as BreakpointValues<T>

//     return {
//       [cssVariable]: responsiveValue.sm,
//       ...createVariable('sm', cssVariable, responsiveValue.sm),
//       ...createVariable('md', cssVariable, responsiveValue.md),
//       ...createVariable('lg', cssVariable, responsiveValue.lg),
//     }
//   }

//   // If `value` is a single value, apply it to all breakpoints
//   return {
//     [`--${cssVariable}`]: value,
//   }
// }

export function rb(
  prefix: string | undefined,
  responsive?: ResponsiveStyle | undefined,
  extra?: Record<string, ResponsiveValue<unknown>>,
): CSSProperties {
  let result: CSSProperties = {}

  const processResponsiveValue = (key: string, value: ResponsiveValue<unknown>) => {
    if (typeof value === 'object' && value !== null) {
      // Handle breakpoint-specific values
      Object.entries(value).forEach(([bp, bpValue]) => {
        result = {
          ...result,
          [`--${bp}-${key}`]: bpValue,
        }
      })
    } else {
      // Handle single values applied to all breakpoints
      result = { ...result, [`--${key}`]: value }
    }
  }

  if (responsive) {
    // Process main responsive styles
    Object.entries(responsive).forEach(([key, value]) => {
      const resolvedKey = prefix ? `${prefix}-${key}` : key

      if (value !== undefined) processResponsiveValue(resolvedKey, value)
    })
  }

  // Process extra properties (e.g., direction, alignment)
  if (extra) {
    Object.entries(extra).forEach(([key, value]) => {
      const resolvedKey = prefix ? `${prefix}-${key}` : key
      if (value !== undefined) processResponsiveValue(resolvedKey, value)
    })
  }

  return result
}
