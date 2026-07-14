#!/usr/bin/env python3
"""
Script to rename directories by removing the left side of hyphens and underscores.
Examples:
  - 0067-find-customer-referee → find-customer-referee
  - Problem_1_Famous_Percentage → Famous_Percentage
"""

import os
import re

def get_new_name(old_name):
    """
    Transform directory name by removing the left side of first hyphen or underscore.
    
    Args:
        old_name: Original directory name
        
    Returns:
        New directory name with left side removed
    """
    # Handle hyphen-separated names (numbers-description pattern)
    if '-' in old_name:
        parts = old_name.split('-', 1)  # Split on first hyphen only
        if len(parts) == 2 and parts[0].isdigit():
            return parts[1]  # Return everything after the first hyphen
    
    # Handle underscore-separated names (Problem_number_description pattern)
    if '_' in old_name:
        parts = old_name.split('_', 1)  # Split on first underscore only
        if len(parts) == 2:
            return '_'.join(parts[1:])  # Return everything after the first underscore
    
    # Return original if no pattern matches
    return old_name

def main():
    """Rename all directories matching the pattern."""
    base_dir = '.'
    renamed_count = 0
    
    # Get list of directories to rename (to avoid modifying during iteration)
    dirs_to_rename = []
    for item in os.listdir(base_dir):
        full_path = os.path.join(base_dir, item)
        if os.path.isdir(full_path) and not item.startswith('.'):
            new_name = get_new_name(item)
            if new_name != item:
                dirs_to_rename.append((item, new_name, full_path))
    
    # Rename directories
    for old_name, new_name, old_path in dirs_to_rename:
        new_path = os.path.join(base_dir, new_name)
        
        # Check if target already exists
        if os.path.exists(new_path):
            print(f"⚠️  Skipped: {old_name} → {new_name} (target already exists)")
            continue
        
        try:
            os.rename(old_path, new_path)
            print(f"✅ Renamed: {old_name} → {new_name}")
            renamed_count += 1
        except Exception as e:
            print(f"❌ Failed: {old_name} → {new_name} ({e})")
    
    print(f"\n📊 Total renamed: {renamed_count}")

if __name__ == "__main__":
    main()
