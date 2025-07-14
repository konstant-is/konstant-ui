const flexRules = {
  direction: {
    row: 'row',
    rowReverse: 'row-reverse',
    column: 'column',
    columnReverse: 'column-reverse',
  },
  wrap: {
    wrap: 'wrap',
    nowrap: 'nowrap',
  },
  shrink: {
    '0': 0,
    '1': 1,
  },
  grow: {
    '0': 0,
    '1': 1,
  },
  alignItems: {
    flexStart: 'flex-start',
    center: 'center',
    flexEnd: 'flex-end',
    baseline: 'baseline',
    stretch: 'stretch',
  },
  alignSelf: {
    flexStart: 'flex-start',
    center: 'center',
    flexEnd: 'flex-end',
    baseline: 'baseline',
    stretch: 'stretch',
  },
  justifyContent: {
    start: 'flex-start',
    center: 'center',
    end: 'flex-end',
    between: 'space-between',
    around: 'space-around',
  },
}

export const rules = {
  flex: flexRules,

  position: {
    absolute: 'absolute',
    relative: 'relative',
    fixed: 'fixed',
    static: 'static',
    sticky: 'sticky',
  },
  display: {
    block: 'block',
    inline: 'inline',
    none: 'none',
    inlineBlock: 'inline-block',
    flex: 'flex',
    inlineFlex: 'inline-flex',
  },
  textAlign: {
    left: 'left',
    center: 'center',
    right: 'right',
  },
  overflow: {
    hidden: 'hidden',
    scroll: 'scroll',
    visible: 'visible',
    auto: 'auto',
    initial: 'initial',
  },
}

export type Display = keyof typeof rules.display

export type Flex = {
  alignItems: keyof typeof rules.flex.alignItems
  alignSelf: keyof typeof rules.flex.alignSelf
  direction: keyof typeof rules.flex.direction
  grow: keyof typeof rules.flex.grow
  justifyContent: keyof typeof rules.flex.justifyContent
  shrink: keyof typeof rules.flex.shrink
  wrap: keyof typeof rules.flex.wrap
}
