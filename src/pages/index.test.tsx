import {render, screen } from 'test-utils'
import '@testing-library/jest-dom'

import Home from './index'

import { AppRouter, appRouter } from '~/server/api/root'
import { inferProcedureInput } from '@trpc/server'
import { createInnerTRPCContext } from '~/server/api/trpc'
import { SessionProvider } from 'next-auth/react';


describe('Home', () => {
  test.only('renders a heading', () => {    
    render(<Home />)

    screen.getByRole("");
    
  });

  // test('gets response', async () => {
  //   const caller = appRouter.createCaller(createInnerTRPCContext({session: null, prisma: prisma}));
  
  //   const input: inferProcedureInput<AppRouter['example']['hello']> = {
  //     text: 'from tRPC'
  //   };
  //   const post = await caller.example.hello(input);

  //   expect(post.greeting).toBe("Hello from tRPC")
  // })
  // test('gets response', async () => {
  //   const caller = appRouter.createCaller(createInnerTRPCContext({session: null, prisma: prisma}));
  
  //   const input: inferProcedureInput<AppRouter['example']['hello']> = {
  //     text: 'from tRPC'
  //   };
  //   const post = await caller.example.hello(input);

  //   expect(post.greeting).toBe("Hello from tRPC")
  // })
})