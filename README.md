# iOS Product API App

# Overview
This project demonstrates API integration using Swift with MVVM architecture, including JSON parsing and error handling.

## Architecture
- Model: Product data (Codable)
- ViewModel: Handles business logic and state
- View: Displays output (simulated)
- Service: Handles API calls using URLSession

## Features
- Real API integration
- JSON parsing using Codable
- Error handling using Result type
- Loading state management
- Clean MVVM architecture

## Tech Stack
- Swift
- URLSession
- MVVM Architecture

## Flow
View → ViewModel → Service → API → JSON → Model → ViewModel → View

## Key Concepts Used
- Completion Handlers
- Async Programming
- Error Handling (Result type)
- Weak self (memory management)

## ⚠️ Note
This project focuses on backend logic and architecture due to non-macOS environment.
