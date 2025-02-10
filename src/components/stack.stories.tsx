import type { Meta, StoryObj } from '@storybook/react'

import { Stack } from './stack'

const meta = {
  title: 'components/stack',
  component: Stack,
  parameters: {
    // Optional parameter to center the component in the Canvas. More info: https://storybook.js.org/docs/configure/story-layout
    layout: 'centered',
  },
  tags: ['autodocs'],
} satisfies Meta<typeof Stack>

export default meta
type Story = StoryObj<typeof meta>

export const primary: Story = {
  args: {
    direction: 'row',
    gap: '16px',
    alignItems: 'center',
    justify: 'flex-start',
    flex: 'initial',
    children: (
      <>
        <div>Item 1</div>
        <div>Item 2</div>
        <div>Item 3</div>
      </>
    ),
  },
}

export const responsive: Story = {
  args: {
    gap: {
      sm: '4px',
      md: '8px',
      lg: '16px',
    },
    direction: {
      sm: 'column',
      md: 'row',
    },
    children: (
      <>
        <div>Item 1</div>
        <div>Item 2</div>
        <div>Item 3</div>
      </>
    ),
  },
}
