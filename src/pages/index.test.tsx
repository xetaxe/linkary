import {render, screen } from '@testing-library/react'
import '@testing-library/jest-dom'

import Home from './index'

import { AppRouter, appRouter } from '~/server/api/root'
import { inferProcedureInput } from '@trpc/server'
import { createInnerTRPCContext } from '~/server/api/trpc'

describe('Home', () => {
  test('renders a heading', async () => {    
    render(<Home />)

    expect(screen.getByText('Create')).toBeInTheDocument()
  });

  // test('gets response', async () => {
  //   const caller = appRouter.createCaller(createInnerTRPCContext({session: null}));
  
  //   const input: inferProcedureInput<AppRouter['example']['hello']> = {
  //     text: 'from tRPC'
  //   };
  //   const post = await caller.example.hello(input);

  //   expect(post.greeting).toBe("Hello from tRPC")
  // })
})