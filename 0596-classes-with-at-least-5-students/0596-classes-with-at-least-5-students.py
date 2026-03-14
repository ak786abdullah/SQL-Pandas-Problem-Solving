# Write a solution to find all the classes that have at least five students.

# Return the result table in any order.
import pandas as pd

def find_classes(courses: pd.DataFrame) -> pd.DataFrame:
    class_count=courses.groupby('class')['student'].count().reset_index()
    return class_count.loc[class_count['student'] >= 5,['class']]
    