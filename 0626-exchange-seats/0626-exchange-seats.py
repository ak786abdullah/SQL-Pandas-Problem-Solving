#Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

# Return the result table ordered by id in ascending order.
import pandas as pd
import numpy as np
def exchange_seats(seat: pd.DataFrame) -> pd.DataFrame:
    total_seats=len(seat)
    conditions =[(seat['id'] % 2== 1 ) & (seat['id'] !=total_seats),seat['id'] % 2 ==0]
    
    choice =[seat['id'] +1 , seat['id']-1]
    seat['id']=np.select(conditions,choice,default=seat['id']) 
    return seat.sort_values('id')