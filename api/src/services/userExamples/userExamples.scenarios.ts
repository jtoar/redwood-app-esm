import type { Prisma, UserExample } from '@prisma/client'
import type { ScenarioData } from '@redwoodjs/testing/api'

export const standard = defineScenario<Prisma.UserExampleCreateArgs>({
  userExample: {
    one: { data: { email: 'String8878725' } },
    two: { data: { email: 'String5326652' } },
  },
})

export type StandardScenario = ScenarioData<UserExample, 'userExample'>
