# Git Workflow Guide for week_6_task

This guide will help you connect your local project to GitHub and perform common Git operations.

## 🚀 Quick Start

### First Time Setup

1. Open PowerShell in the project directory:
   ```powershell
   cd "C:\Users\Admin\Desktop\Flutter Projects\week_6_task"
   ```

2. Run the interactive Git operations menu:
   ```powershell
   .\git_operations.ps1
   ```

3. Select option **1** (Initial Setup) to:
   - Clone the repository
   - Copy your project files
   - Make initial commit
   - Push to GitHub

## 📋 Available Scripts

### 1. `git_operations.ps1` (Recommended)
Interactive menu with all Git operations:
- Initial Setup
- Pull/Push
- Branch management
- View status and history
- Commit changes

**Usage:**
```powershell
.\git_operations.ps1
```

### 2. `git_commands_reference.ps1`
Quick reference guide showing all Git commands.

**Usage:**
```powershell
.\git_commands_reference.ps1
```

## 🔄 Common Workflows

### Daily Development Workflow

1. **Start your day - Pull latest changes:**
   ```powershell
   cd "C:\Users\Admin\Desktop\Flutter Projects\mentorship_round_3"
   git pull
   ```

2. **Make your changes** in the project files

3. **Sync changes to repository:**
   ```powershell
   .\git_operations.ps1
   ```
   Then select option 9 (Add & Commit Changes)

4. **Push to GitHub:**
   Select option 3 (Push Changes)

### Working with Branches

#### Create a new feature branch:
```powershell
cd "C:\Users\Admin\Desktop\Flutter Projects\mentorship_round_3"
git checkout -b feature/my-new-feature
```

#### Switch between branches:
```powershell
git checkout main
git checkout feature/my-new-feature
```

#### List all branches:
```powershell
git branch -a
```

### Syncing Your Work

#### Pull latest changes from remote:
```powershell
cd "C:\Users\Admin\Desktop\Flutter Projects\mentorship_round_3"
git pull origin main
```

#### Push your changes:
```powershell
git push origin main
```

#### Push a new branch:
```powershell
git push -u origin branch-name
```

## 📝 Git Commands Cheatsheet

| Action | Command |
|--------|---------|
| Check status | `git status` |
| Add all changes | `git add .` |
| Commit changes | `git commit -m "message"` |
| Push changes | `git push` |
| Pull changes | `git pull` |
| Create branch | `git checkout -b branch-name` |
| Switch branch | `git checkout branch-name` |
| List branches | `git branch -a` |
| View history | `git log --oneline --graph` |
| Discard changes | `git checkout -- file-name` |
| Undo last commit | `git reset --soft HEAD~1` |

## 🎯 Best Practices

1. **Commit Often**: Make small, focused commits with clear messages
2. **Pull Before Push**: Always pull latest changes before pushing
3. **Use Branches**: Create feature branches for new features
4. **Write Good Commit Messages**: 
   - ✅ "Add user authentication feature"
   - ✅ "Fix navigation bug in home screen"
   - ❌ "Update"
   - ❌ "Fix"

## 🔧 Troubleshooting

### Repository not found
- Run Initial Setup (option 1 in `git_operations.ps1`)

### Merge conflicts
```powershell
# Pull latest changes
git pull

# Resolve conflicts in files manually
# Then:
git add .
git commit -m "Resolve merge conflicts"
git push
```

### Reset to last commit (discard all local changes)
```powershell
git reset --hard HEAD
```

## 📍 Important Paths

- **Your working project**: `C:\Users\Admin\Desktop\Flutter Projects\week_6_task`
- **Git repository**: `C:\Users\Admin\Desktop\Flutter Projects\mentorship_round_3`
- **Remote repository**: https://github.com/MohammedAttia3104/mentorship_round_3.git

## 🆘 Need Help?

Run the interactive menu for guided operations:
```powershell
.\git_operations.ps1
```

Or view quick commands reference:
```powershell
.\git_commands_reference.ps1
```

