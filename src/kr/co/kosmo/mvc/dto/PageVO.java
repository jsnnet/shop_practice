package kr.co.kosmo.mvc.dto;

public class PageVO {

	private int currentPage; // ���� ��������ȣ
	private int currentBlock; // ���� ��Ϲ�ȣ
	private int rowsPerPage; // �� �������� ������ ��� ��
	private int pagesPerBlock; // �� ��ϴ� ������ ������ ��
	private int totalRows; // ��ü ��� ��
	private int totalPages; // ��ü ������ ��
	private int totalBlocks; // ��ü ��� ��
	private int startRows; // ���� ��� ��ȣ - �������� ������ ���� ���� ����
	private int endRows; // ������ ��Ϲ�ȣ - �������� ������ ���� ���� ����

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getCurrentBlock() {
		return currentBlock;
	}

	public void setCurrentBlock(int currentBlock) {
		this.currentBlock = currentBlock;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}

	public int getPagesPerBlock() {
		return pagesPerBlock;
	}

	public void setPagesPerBlock(int pagesPerBlock) {
		this.pagesPerBlock = pagesPerBlock;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getTotalBlocks() {
		return totalBlocks;
	}

	public void setTotalBlocks(int totalBlocks) {
		this.totalBlocks = totalBlocks;
	}

	public int getStartRows() {
		return startRows;
	}

	public void setStartRows(int startRows) {
		this.startRows = startRows;
	}

	public int getEndRows() {
		return endRows;
	}

	public void setEndRows(int endRows) {
		this.endRows = endRows;
	}

}
