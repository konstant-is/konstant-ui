import type { Meta, StoryObj } from '@storybook/react'

import { Gutter } from './gutter'

const meta = {
  title: 'components/gutter',
  component: Gutter,
  parameters: {
    // Optional parameter to center the component in the Canvas. More info: https://storybook.js.org/docs/configure/story-layout
    // layout: 'centered',
  },
  tags: ['autodocs'],
} satisfies Meta<typeof Gutter>

export default meta
type Story = StoryObj<typeof meta>

export const primary: Story = {
  args: {
    asChild: true,
    children: (
      <div
        style={{
          background: 'rgba(255, 0, 0, 0.1)',
        }}
      >
        <div
          style={{
            display: 'flex',
            flex: '1',
            background: 'rgba(255, 0, 0, 0.3)',
            padding: 24,
          }}
        >
          Item 1
        </div>
      </div>
    ),
  },
}
