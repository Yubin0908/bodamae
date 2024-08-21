package himedia.project.bodamae.service;

import lombok.Data;

@Data
public class Pagination {
    private int currentPage = 1;
    private int pageSize;
    private int blockSize;
    private int startRow;
    private int endRow;
    private int total;
    private int totalPages;
    private int startPage;
    private int endPage;

    public Pagination(int total, String page, int pageSize, int blockSize) {
        this.total = total;

        if (page != null) {
            currentPage = Integer.parseInt(page);
        }

        this.pageSize = pageSize;
        this.blockSize = blockSize;
        startRow = (currentPage - 1) * blockSize + 1;
        endRow = startRow + pageSize - 1;
        totalPages = (int)Math.ceil((double)total / pageSize);
        startPage = ((currentPage - 1) / blockSize) * blockSize + 1;
        endPage = startPage + blockSize - 1;

        if (endPage > totalPages) {
            this.endPage = totalPages;
        }
    }
}
