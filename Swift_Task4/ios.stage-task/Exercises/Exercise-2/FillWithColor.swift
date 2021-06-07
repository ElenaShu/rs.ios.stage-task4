import Foundation

final class FillWithColor {
    
    var arr = [[Int]]()
    
    func colorPixel (row: Int, column: Int, oldColor: Int, newColor: Int) {
        arr[row][column] = newColor
        if row != 0 {
            if arr[row-1][column] == oldColor {
                colorPixel(row: row-1, column: column, oldColor: oldColor, newColor: newColor)
            }
        }
        if column != 0 {
            if arr[row][column-1] == oldColor {
                colorPixel(row: row, column: column-1, oldColor: oldColor, newColor: newColor)
            }
        }
        if (row+1) != arr.count {
            if arr[row+1][column] == oldColor {
                colorPixel(row: row+1, column: column, oldColor: oldColor, newColor: newColor)
            }
        }
        if (column+1) != arr[0].count {
            if arr[row][column+1] == oldColor {
                colorPixel(row: row, column: column+1, oldColor: oldColor, newColor: newColor)
            }
        }
        return
    }
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {
        arr = image
        guard image.count > 0 else { return image }
        guard image[0].count > 0 else { return image }
        guard row >= 0 && column >= 0 && image.count <= 50 && image[0].count <= 50 && newColor >= 0 && newColor <= 65536 else { return image }
        guard row < image.count else { return image }
        guard column < image[row].count else { return image }
        guard image[row][column] >= 0 && image[row][column] <= 65536 else { return image }
        colorPixel(row: row, column: column, oldColor: arr[row][column], newColor: newColor)
        return arr
    }
}
