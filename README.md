# MediNotes Pro

An AI-powered medical consultation assistant that transforms doctor's consultation notes into professional summaries, actionable next steps, and patient-friendly email communications.

## Overview

MediNotes Pro is a full-stack SaaS application that leverages AI to help healthcare professionals streamline their documentation workflow. By simply entering patient consultation notes, doctors can automatically generate:

- **Professional Medical Summaries** - Comprehensive summaries for medical records
- **Action Items** - Clear next steps and follow-up actions
- **Patient Communications** - Draft emails in patient-friendly language

## Tech Stack

### Frontend

- **Next.js 16.1** - React framework with App Router
- **React 19.2** - UI library
- **TypeScript** - Type-safe development
- **Tailwind CSS 4** - Utility-first CSS framework
- **Clerk** - Authentication and user management
- **React Markdown** - Markdown rendering with GitHub Flavored Markdown support
- **React DatePicker** - Date selection component

### Backend

- **FastAPI** - Python web framework for the API
- **OpenAI API** - AI-powered text generation with streaming support
- **Clerk Auth** - Secure JWT authentication
- **Pydantic** - Data validation

### Infrastructure

- **Vercel** - Deployment platform
- **Python 3.x** - Backend runtime

## Features

- 🔐 **Secure Authentication** - Clerk-powered user authentication with protected routes
- 🎨 **Modern UI** - Responsive design with dark mode support
- 📝 **Real-time Streaming** - AI responses stream in real-time using Server-Sent Events (SSE)
- 🔒 **Protected API** - JWT-authenticated API endpoints
- 📧 **Email Drafting** - Automatically generate patient-friendly communications
- 📋 **Professional Documentation** - Generate structured medical summaries

## Project Structure

```
├── app/                    # Next.js App Router
│   ├── page.tsx           # Landing page with features showcase
│   ├── product/           # Protected consultation form page
│   ├── layout.tsx         # Root layout with Clerk provider
│   └── globals.css        # Global styles
├── api/                   # Python FastAPI backend
│   └── index.py          # API endpoints with OpenAI integration
├── middleware.ts          # Clerk authentication middleware
├── vercel.json           # Vercel deployment configuration
└── requirements.txt      # Python dependencies
```

## Getting Started

### Prerequisites

- Node.js 20+ and npm/yarn/pnpm
- Python 3.x
- OpenAI API key
- Clerk account with API keys

### Environment Variables

Create a `.env.local` file in the root directory:

```bash
# Clerk Authentication
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=your_clerk_publishable_key
CLERK_SECRET_KEY=your_clerk_secret_key
CLERK_JWKS_URL=your_clerk_jwks_url

# OpenAI
OPENAI_API_KEY=your_openai_api_key
```

### Installation

1. Install Node.js dependencies:

```bash
npm install
# or
yarn install
# or
pnpm install
```

2. Install Python dependencies:

```bash
pip install -r requirements.txt
```

### Running the Development Server

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000) to see the application.

The API endpoint will be available at [http://localhost:3000/api](http://localhost:3000/api).

## Usage

1. **Sign In** - Create an account or sign in using Clerk authentication
2. **Navigate to Product** - Access the consultation form
3. **Enter Details** - Fill in patient name, visit date, and consultation notes
4. **Generate** - Click submit to generate AI-powered summaries and drafts
5. **Review** - View the streamed response with formatted markdown

## API Endpoints

### POST `/api`

Generate consultation summaries from doctor's notes.

**Authentication:** Required (JWT Bearer token)

**Request Body:**

```json
{
  "patient_name": "John Doe",
  "date_of_visit": "2025-12-24",
  "notes": "Patient consultation notes..."
}
```

**Response:** Server-Sent Events (SSE) stream with markdown-formatted content

## Deployment

### Deploy to Vercel

The easiest way to deploy this application is using Vercel:

1. Push your code to a Git repository
2. Import the project to Vercel
3. Configure environment variables
4. Vercel will automatically detect and deploy both Next.js and Python components

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new)

### Environment Configuration

Make sure to add all required environment variables in your Vercel project settings.

## Learn More

- [Next.js Documentation](https://nextjs.org/docs)
- [Clerk Documentation](https://clerk.com/docs)
- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [OpenAI API Documentation](https://platform.openai.com/docs)
- [Vercel Documentation](https://vercel.com/docs)

## License

This project is private and proprietary.
