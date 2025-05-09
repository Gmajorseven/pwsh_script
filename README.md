# BCContainer Installation Guide

## Introduction
BCContainer is a tool designed to facilitate the setup and management of Business Central containers. This guide covers installation for both **local environments** and **servers**.

## Prerequisites
Before proceeding, ensure you have:
- **Docker installed** ([Download Docker](https://www.docker.com/get-started))
- **PowerShell** available on your system
- **Administrator privileges**

## Installation Methods
### 1. Local Installation (Using Docker)
1. Open PowerShell in administrator mode.
2. Install `BcContainerHelper` by running:

   ```powershell
   Install-Module -Name BcContainerHelper -Force
