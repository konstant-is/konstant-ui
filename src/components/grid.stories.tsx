import type { Meta, StoryObj } from '@storybook/react'

import { Grid } from './grid'

const meta = {
  title: 'components/grid',
  component: Grid,
  parameters: {
    // Optional parameter to center the component in the Canvas. More info: https://storybook.js.org/docs/configure/story-layout
    layout: 'centered',
  },
  tags: ['autodocs'],
} satisfies Meta<typeof Grid>

export default meta
type Story = StoryObj<typeof meta>

export const primary: Story = {
  args: {
    cols: 3,
    gutter: 24,
    children: (
      <>
        <div>Item 1</div>
        <div>Item 2</div>
        <div>Item 3</div>
      </>
    ),
  },
}
