--Basic function

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y  


-- Guards
bmiTell :: (RealFloat a) => a -> String  
bmiTell bmi  
 | bmi <= 18.5 = "You're underweight, you emo, you!"  
 | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
 | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
 | otherwise   = "You're a whale, congratulations!"  

-- where

initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
  where (f:_) = firstname  
        (l:_) = lastname    

calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi w h | (w, h) <- xs]  
    where bmi weight height = weight / height ^ 2  
--let 
cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea

--case 
describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."
                                               xs -> "a longer list."  
