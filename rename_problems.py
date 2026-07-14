#!/usr/bin/env python3
"""
Script to rename Problem_N_* directories to sequential numbering.
This script uses git mv to maintain commit history.
"""

import os
import subprocess
import re
from pathlib import Path

def get_problem_dirs():
    """Get all Problem_N_* directories and sort them."""
    repo_root = Path('.')
    problem_dirs = []
    
    for item in repo_root.iterdir():
        if item.is_dir() and item.name.startswith('Problem_'):
            # Extract the current number
            match = re.match(r'Problem_(\d+)_(.+)', item.name)
            if match:
                current_num = int(match.group(1))
                title = match.group(2)
                problem_dirs.append((current_num, title, item.name))
    
    # Sort by current number
    problem_dirs.sort(key=lambda x: x[0])
    return problem_dirs

def rename_directories():
    """Rename all Problem directories sequentially."""
    problem_dirs = get_problem_dirs()
    
    if not problem_dirs:
        print("No Problem_N_* directories found!")
        return
    
    print(f"Found {len(problem_dirs)} problem directories to rename:\n")
    
    # Create a mapping of old name to new name
    rename_map = {}
    for idx, (_, title, old_name) in enumerate(problem_dirs, 1):
        new_name = f"Problem_{idx}_{title}"
        rename_map[old_name] = new_name
        print(f"{old_name:50} -> {new_name}")
    
    print("\n" + "="*100)
    confirm = input("\nProceed with renaming? (yes/no): ").strip().lower()
    
    if confirm != 'yes':
        print("Cancelled.")
        return
    
    print("\nRenaming directories...\n")
    
    # Perform renames using git mv to maintain history
    for old_name, new_name in rename_map.items():
        if old_name == new_name:
            print(f"✓ {old_name} (no change needed)")
            continue
        
        try:
            result = subprocess.run(
                ['git', 'mv', old_name, new_name],
                capture_output=True,
                text=True,
                check=True
            )
            print(f"✓ {old_name} -> {new_name}")
        except subprocess.CalledProcessError as e:
            print(f"✗ Failed to rename {old_name}: {e.stderr}")
    
    print("\n" + "="*100)
    print("\nAll renames complete!")
    print("\nNext steps:")
    print("1. Review the changes: git status")
    print("2. Commit the changes: git commit -m 'Rename problems with sequential numbering'")
    print("3. Push to remote: git push")

if __name__ == "__main__":
    rename_directories()
